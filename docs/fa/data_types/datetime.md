<div dir="rtl">

# DateTime

تاریخ با ساعت 4 بایت به صورت Unix timestamp ذخیره می کند (unsigned). به شما اجازه ی ذخیره سازی در محدوده ی تایپ Date را می دهد. حداقل مقدار در خروجی 0000-00-00 00:00:00 می باشد. زمان با دقت تا یک ثانیه ذخیره می شود.

## Time zones

این type از text به باینری تبدیل می شود، و در هنگام برگشت با توجه به time zone سرور، در زمانی که کلاینت یا سرور شروع به کار می کند تبدیل می شود. در فرمت text، اطلاعات DST از دست می رود.

به صورت پیش فرض زمانی که کلاینت به سرور کانکت می شود، timezone آن به تنظیم سرور تغییر می کند. شما می توانیید این رفتار را با فعال سازی گزینه `--use_client_time_zone` در محیط command-line تغییر دهید.

Supports only those time zones that never had the time differ from UTC for a partial number of hours (without leap seconds) over the entire time range you will be working with.

پس در هنگام کار با تاریخ متنی (برای مثال زمانی که دامپ text می گیرید)، به خاطر داشته باشید که ممکن است به دلیل تغییرات DST، نتایج مبهمی در خروجی ببینید، و ممکن است در صورت تغییر time zone مشکلی با مطابقت خروجی با داده ها وجود داشته باشد.

</div>