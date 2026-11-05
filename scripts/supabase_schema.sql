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

-- تفعيل سياسات الأمان على مستوى الصفوف (Row Level Security - RLS)
ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

-- السماح للزوار (المجهولين أو المستخدمين) بإرسال حجز جديد من الموقع
CREATE POLICY "Allow anonymous insert for bookings"
ON public.bookings
FOR INSERT
TO anon, authenticated
WITH CHECK (true);

-- السماح بالقراءة والتعديل والحذف لمفتاح الخدمة أو المفتاح العام بحسب بيئة العمل
CREATE POLICY "Allow full access for authenticated/anon for dashboard"
ON public.bookings
FOR ALL
TO anon, authenticated
USING (true)
WITH CHECK (true);

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

