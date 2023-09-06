import BaiViet1 from "./BaiViet/BaiViet1";
import BaiViet2 from "./BaiViet/BaiViet2";
import "../layout/style.scss"
import { Container } from "react-bootstrap";

const TrangChu = () => {

    return (
        <>
            <h1 className="text-center text-info">DANH MỤC SẢN PHẨM</h1>
            <Container className="trangchu">
                <div className="trangchu-baiviet">
                    <BaiViet1 />
                    <BaiViet2 />
                </div>
                <div className="trangchu-timkiem">
                    <h1 className="text-info text-center">TÌM KIẾM</h1>
                </div>
            </Container>

        </>

    )
}

export default TrangChu;