# ndc

Đây là source code [blog của mình](http://www.purinpurin.me/) được viết bằng **Ruby on Rails**. Các bạn nếu muốn có thể lấy về sửa css rồi deploy mà dùng. Mình xin giới thiệu sơ qua một tí về source này.

## Người dùng

Đầu tiên, mình dùng [Devise](https://github.com/plataformatec/devise) để chứng thực, hiện chỉ có duy nhất một admin, có thể tạo tài khoản admin mới bằng Rails Console (`rails c`) hoặc `seeds.rb` đó là tuỳ bạn. Ngoài admin có thể có các user khác mà mình cũng đã thiết lập chức năng đăng kí bằng mail và gửi mail xác thực rồi (dùng SMTP của google). Admin có thể thêm sửa xoá bài viết.

## Bài viết

Có hai loại bài viết, một là bài viết thông thường, dạng blog post sẽ xuất hiện trên trang chính, trong code mình gọi chúng là `common`, loại thứ 2 là TodayILearn (`til`), cứ mỗi ngày mình sẽ học được gì đó và viết lại ở đây.

Tất cả những bài viết này mình đều dùng markdown để viết, dùng gem [`redcarpet`](https://github.com/vmg/redcarpet) để chuyển về html.

### Common

Với những bài `common` thì thường mình sẽ tìm hiểu rồi trình bày một cách hệ thống, có cấu trúc, đó là những bài mình ấp ủ lâu hoặc tổng hợp từ `til` một cách bài bản.

Vì đa phần là bài viết dài và có hệ thống nên sẽ có thêm mục lục cho từng bài viết. Muốn hiển thị đúng mục lục các bạn cần nhớ

- Mục lục chỉ áp dụng cho h2 và h3
- Luôn ưu tiên dùng h2 trước, h3 phải nằm trong h2

Mỗi bài viết đều hiển thị thêm ngày viết và số lượt xem.

### TIL

Những bài này vì tính chất đơn giản, ghi chú là chính nên không có mục lục.

## Những thứ for fun khác

Có một dashboard hiển thị trực quan bài viết với lượt xem

Có một bàn cờ caro cho hai người chơi trên cùng một máy

---

## TODO:

- [ ] Phân trang bài đăng trên trang chính
- [ ] Gợi ý bài đọc tiếp theo hoặc liên quan trên từng bài đăng
- [ ] Cho phép bình luận bài đăng
- [ ] Cho phép đánh giá bài đăng bằng icon hoặc tương tác,...
- [ ] Góc bàn luận
- [ ] Chơi online caro
- [ ] Chơi caro với bot
