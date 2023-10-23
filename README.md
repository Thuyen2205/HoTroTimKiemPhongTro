# HoTroTimKiemPhongTro

## Tóm tắt
Dự án này là một website xây dựng để hỗ trợ tìm kiếm nhà trọ bằng sử dụng ngôn ngữ Java và framework Spring MVC cho phía máy chủ và React cho phía giao diện người dùng. Website cho phép người dùng thực hiện tìm kiếm theo nhiều tiêu chí khác nhau, đăng bài viết tìm kiếm thông tin... Hệ thống website bao gồm 3 vai trò chính là khách hàng, chủ trọ và Admin. Mỗi vai trò khi đăng nhập sử dụng hệ thống sẽ có những chức năng khác nhau dành riêng cho người sử dụng đó. Đối với khách hàng có thể tìm kiếm được những nhà trọ bằng cách xem những bài viết mà chủ trọ đã đăng ngoài ra khách hàng cũng có thể đăng bài riêng cho chính bản thân phù hợp với từng mục đích nhu cầu đề ra, khách hàng cũng có thể sử dụng bản đồ được tích hợp sẵn trong hệ thống để có thể tìm kiếm một cách dễ dàng và sinh động hơn. Với vai trò là chủ trọ, chủ trọ có thể tiếp cận được với số lượng lớn khách hàng tiềm năng, có nhu cầu tìm kiếm nhà trò bằng cách đăng những bài viết giới thiệu về phòng trọ của mình để khách hàng có thể xem và đánh giá. Admin chính là một vai trò quan trọng trong việc đảm bảo được những tài khoản, những nguồn thông tin đáng tin cậy ra vào hệ thống, nâng cao chất lượng dịch vụ đến với người dùng.

## Chức năng chính
Dự án này bao gồm các chức năng sau:

- Đăng ký
- Đăng nhập
- Đăng bài viết cho thuê trọ
- Đăng bài viết tìm trọ
- Bình luận
- Tìm kiếm
- Xem chi tiết bài viết
- Xem bản đồ
- Thống kê
- Duyệt bài viết
- Duyệt tài khoản

## Cài đặt và Chạy

### Yêu cầu

- JDK 11: Đảm bảo bạn đã cài đặt JDK phiên bản 11. Bạn có thể tải JDK từ trang chính của Oracle hoặc sử dụng một phiên bản OpenJDK.
- NetBeans IDE: Dự án được phát triển bằng NetBeans, vì vậy bạn nên cài đặt NetBeans IDE để mở và quản lý mã nguồn của dự án.
- MySQL: Để sử dụng cơ sở dữ liệu, bạn cần cài đặt và cấu hình MySQL Server trên máy tính của bạn.

### Cài đặt

1. **Sao chép mã nguồn**: Sao chép mã nguồn từ kho lưu trữ GitHub của dự án.

2. **Mở dự án trên NetBeans**:
   - Mở NetBeans IDE.
   - Chọn File -> Open Project và chọn thư mục chứa mã nguồn của dự án.
   - Dự án sẽ được tải vào NetBeans.

3. **Cấu hình cơ sở dữ liệu**:
   - Mở MySQL Workbench hoặc một công cụ quản lý cơ sở dữ liệu khác để tạo cơ sở dữ liệu mới có tên bất kì. Sau đó, kết nối cơ sở dữ liệu mới tạo kết nối vào cơ sở dữ liệu từ kho lưu trữ GitHub có tên là QuanLiPhongTro.sql
   - Cập nhật thông tin kết nối đến cơ sở dữ liệu MySQL trong tệp `database.properties` của dự án. :
      - Tìm tệp `database.properties`trong dự án của bạn thường thì tệp này được đặt trong thư mục src/main/resources hoặc một vị trí tương tự.
      - Mở tệp `database.properties`
      - Bên trong tệp database.properties, bạn cần thay đổi:
         - database.username=your_username: Thay thế your_username bằng tên người dùng MySQL của bạn.
         - database.password=your_password: Thay thế your_password bằng mật khẩu MySQL của bạn.
      - Lưu tệp database.properties sau khi bạn đã cập nhật thông tin.

4. **Chạy dự án**:
   - Mở NetBeans:
      - Khởi động NetBeans IDE trên máy tính của bạn.
   - Mở dự án:
      - Mở dự án mà bạn muốn chạy bằng cách nhấp vào "File" và sau đó chọn "Open Project" (Mở Dự án).
      - Tìm và chọn thư mục chứa dự án của bạn, sau đó nhấp vào nút "Open Project" (Mở Dự án).
   - Chọn Configurations (Tùy chỉnh):
      - Trước khi chạy dự án, bạn nên đảm bảo rằng bạn đã chọn cấu hình cần thiết cho dự án của mình (chẳng hạn như Debug hoặc Release). Điều này thường nằm ở phía trên cửa sổ NetBeans, gần nút "Run" (Chạy). Bạn có thể chọn tùy chỉnh này trong danh sách thả xuống.
   - Chạy dự án:
      - Bấm chuột phải vào dự án trong thanh dự án (Project Explorer) của NetBeans. Dự án thường được liệt kê ở phía bên trái cửa sổ.
      - Chọn "Run" (Chạy) từ menu ngữ cảnh mà hiện ra sau khi bạn bấm chuột phải. Hoặc bạn cũng có thể nhấp vào biểu tượng "Run" (mũi tên xanh) trên thanh công cụ hoặc sử dụng phím tắt Ctrl+F6.
   - Đợi cho ứng dụng triển khai và chạy:
      - NetBeans sẽ tiến hành biên dịch và triển khai ứng dụng của bạn. Sau khi hoàn tất, ứng dụng sẽ tự động chạy trên máy tính của bạn. Bạn sẽ thấy kết quả trong cửa sổ Output (Kết quả) hoặc Output Console (Bảng điều khiển Kết quả).

### Ghi chú
- Dự án này sử dụng JDK 11, vui lòng đảm bảo rằng NetBeans đang sử dụng JDK này để chạy ứng dụng.
- Để thực hiện kiểm duyệt dữ liệu bởi Admin, bạn cần thực hiện đăng nhập với vai trò "Quản trị viên" bằng tài khoản quản trị viên.


## Đóng góp
Chúng tôi rất hoan nghênh đóng góp từ cộng đồng. Nếu bạn muốn đóng góp vào dự án này, vui lòng tạo một yêu cầu kéo (pull request) hoặc báo cáo sự cố (issue).

## Liên hệ
Nếu bạn cần hỗ trợ hoặc có bất kỳ câu hỏi nào liên quan đến dự án này, vui lòng liên hệ qua email: 2051050343phat@ou.edu.vn hoắc thông qua số điện thoại: 0965667795



