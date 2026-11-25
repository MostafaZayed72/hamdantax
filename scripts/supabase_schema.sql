-- ========================================================
-- جدول الحجوزات (Bookings Table) لموقع حمدان تاكس
-- ========================================================

-- إنشاء جدول الحجوزات
CREATE TABLE IF NOT EXISTS public.bookings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT,
    service TEXT NOT NULL DEFAULT 'Tax Return Preparation',
    preferred_date DATE,
    preferred_time TEXT,
    message TEXT,
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
    notes TEXT
);

-- إنشاء فهارس لتسريع البحث والفرز
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON public.bookings(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_bookings_status ON public.bookings(status);
CREATE INDEX IF NOT EXISTS idx_bookings_email ON public.bookings(email);

-- تفعيل التحديث التلقائي لحقل updated_at
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = timezone('utc'::text, now());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS set_bookings_updated_at ON public.bookings;
CREATE TRIGGER set_bookings_updated_at
BEFORE UPDATE ON public.bookings
FOR EACH ROW
EXECUTE FUNCTION public.handle_updated_at();

-- تعديل الحقول لتكون اختيارية باستثناء رقم الهاتف لتمكين الربط مع روبوت واتساب
ALTER TABLE public.bookings ALTER COLUMN email DROP NOT NULL;
ALTER TABLE public.bookings ALTER COLUMN name DROP NOT NULL;
ALTER TABLE public.bookings ALTER COLUMN service DROP NOT NULL;

-- وظيفة ذكية لتحديث بيانات العميل تلقائياً إذا كان رقم هاتفه مسجلاً مسبقاً (Upsert Trigger)
CREATE OR REPLACE FUNCTION public.handle_upsert_booking()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.bookings WHERE phone = NEW.phone) THEN
        UPDATE public.bookings
        SET 
            name = COALESCE(NULLIF(NEW.name, ''), public.bookings.name),
            email = COALESCE(NULLIF(NEW.email, ''), public.bookings.email),
            service = COALESCE(NULLIF(NEW.service, ''), public.bookings.service),
            message = COALESCE(NULLIF(NEW.message, ''), public.bookings.message),
            preferred_date = COALESCE(NEW.preferred_date, public.bookings.preferred_date),
            preferred_time = COALESCE(NULLIF(NEW.preferred_time, ''), public.bookings.preferred_time),
            updated_at = timezone('utc'::text, now())
        WHERE phone = NEW.phone;
        RETURN NULL; -- يمنع تكرار العميل ويكتفي بتحديث بياناته الحالية
    END IF;
    RETURN NEW; -- في حال كان عميلاً جديداً تتم إضافته كصف جديد
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_upsert_booking ON public.bookings;
CREATE TRIGGER trg_upsert_booking
BEFORE INSERT ON public.bookings
FOR EACH ROW
EXECUTE FUNCTION public.handle_upsert_booking();

-- الخيار الأبسط والأضمن: تعطيل نظام حظر الصلاحيات للجدول للسماح بالحذف والتعديل المباشر
ALTER TABLE public.bookings DISABLE ROW LEVEL SECURITY;

-- أو في حال رغبت في إبقاء الحماية مفعلة، قم بتفعيل سياسات الحذف والتعديل التالية:
-- ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Allow full access for bookings" ON public.bookings FOR ALL TO anon, authenticated USING (true) WITH CHECK (true);
-- CREATE POLICY "Allow delete for bookings" ON public.bookings FOR DELETE TO anon, authenticated USING (true);
-- CREATE POLICY "Allow update for bookings" ON public.bookings FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);

-- تفعيل خاصية Realtime لمزامنة التحديثات اللحظية مع الواجهة
ALTER PUBLICATION supabase_realtime ADD TABLE public.bookings;

-- ========================================================
-- بيانات تجريبية اختيارية للاختبار السريع
-- ========================================================
INSERT INTO public.bookings (name, email, phone, service, preferred_date, preferred_time, message, status, notes)
VALUES
('أحمد الشمري', 'ahmed@example.com', '+971501234567', 'Tax Return Preparation', CURRENT_DATE + INTERVAL '2 day', '10:00 AM', 'استشارة حول الإقرار الضريبي للشركات الصغيرة', 'pending', 'تم التواصل مبدئياً عبر البريد'),
('سارة المنصوري', 'sara@example.com', '+971509876543', 'Accounting Services', CURRENT_DATE + INTERVAL '3 day', '02:30 PM', 'طلب خدمات المحاسبة ومسك الدفاتر السنوية', 'confirmed', 'حجز مؤكد'),
('محمد الزهراني', 'mohammed@example.com', '+966551234567', 'IRS / Sales Tax Representation', CURRENT_DATE - INTERVAL '1 day', '11:00 AM', 'متابعة ملف الفحص الضريبي', 'completed', 'تم الانتهاء من الملف بنجاح');

