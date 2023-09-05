import { Button, Container, Form } from "react-bootstrap";
import Apis, { endpoints } from "../../configs/Apis";
import MySpinner from "../../layout/MySpinner";
import { useNavigate, useParams } from "react-router-dom";
import { useContext, useRef, useState } from "react";
import "../BaiViet/BViet.scss";
import { MyUserContext } from "../../App";

const CapNhatBV = ({ baivietId }) => {
    const [user] = useContext(MyUserContext);
    const [thtinbviet, setThtinBviet] = useState(null);
    const { id } = useParams();
    const [err, setErr] = useState(null);

    const loadThtinBviet = async () => {
        let { data } = await Apis.get(`${endpoints['thtin-bviet']} + ${id}`);
        setThtinBviet(data);
    }
    loadThtinBviet();

    const [baiviet, setBaiViet] = useState({
        "ten": "",
        "noidung": "",
        "phamvi": "",
        "soluong": "",
        "giathue": "",
        "dientich": "",
        "diachi": "",
        "userid": user.id,
        "usertypeId": user.idLoaiTaiKhoan.id
    });
    const hinhanh = useRef();
    const nav = useNavigate();

    const capnhat = (evt) => {
        evt.preventDefault();
        const process = async () => {
            let form = new FormData();
            for (let field in baiviet) {
                form.append(field, baiviet[field]);
                if (user.idLoaiTaiKhoan.id === 3) {

                } else if (user.idLoaiTaiKhoan.id === 2) {
                    form.append("hinhanh", hinhanh.current.files[0]);
                } else {
                    nav("/");
                }
            }

            let res = await Apis.post(endpoints['capnhatbv'], form);

            if (res.status === 201) {
                nav("/");
            } else
                setErr("Hệ thống bị lỗi!");
        }
        process();
    }

    if (!thtinbviet) {
        return <MySpinner />
    }

    const change = (evt, field) => {
        // setUser({...user, [field]: evt.target.value})
        setBaiViet(current => {
            return { ...current, [field]: evt.target.value }
        })
    }
    // console.log(baiviet);
    return (
        <>
            <Container>
                <h1>CẬP NHẬT BÀI VIẾT</h1>
                <div className="thtinbviet">
                    <div className="thtin-col1">
                        <div className="thtin-anh">
                            <img src={thtinbviet.hinhAnh} width="100%"></img>
                        </div>
                        <div className="thtin-ndung">
                            {user.idLoaiTaiKhoan.id === 2 ? <>
                                
                                <Form onSubmit={capnhat}>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Tiêu đề bài viết</Form.Label>
                                        <Form.Control value={thtinbviet.noiDung} type="text" onChange={(e) => change(e, "ten")} placeholder="Tiêu đề bài viết" required />
                                    </Form.Group>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Ngày đăng</Form.Label>
                                        <Form.Control type="date" disabled />
                                    </Form.Group>
                                    <div className="formGroup1">
                                        <Form.Group className="mb-3 group11">
                                            <Form.Label>Khu vực</Form.Label>
                                            <Form.Control type="text" onChange={(e) => change(e, "phamvi")} placeholder="Khu vực" required />
                                        </Form.Group>
                                        <Form.Group className="mb-3 group12">
                                            <Form.Label>Số lượng</Form.Label>
                                            <Form.Control type="text" onChange={(e) => change(e, "soluong")} placeholder="Số lượng" required />
                                        </Form.Group>
                                    </div >
                                    <div className="formGroup2">
                                        <Form.Group className="mb-3 group11">
                                            <Form.Label>Giá thuê</Form.Label>
                                            <Form.Control type="text" onChange={(e) => change(e, "giathue")} placeholder="Giá thuê" required />
                                        </Form.Group>
                                        <Form.Group className="mb-3 group12">
                                            <Form.Label>Diện tích</Form.Label>
                                            <Form.Control type="text" onChange={(e) => change(e, "dientich")} placeholder="Diện tích" required />
                                        </Form.Group>
                                    </div>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Địa chỉ chi tiết</Form.Label>
                                        <Form.Control type="text" onChange={(e) => change(e, "diachi")} placeholder="Địa chỉ chi tiết" required />
                                    </Form.Group>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Hình ảnh phòng trọ</Form.Label>
                                        <Form.Control type="file" ref={hinhanh} />
                                    </Form.Group>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Mô tả chi tiết</Form.Label>
                                        <Form.Control as="textarea" rows={5} onChange={(e) => change(e, "noidung")} placeholder="Mô tả chi tiết" required />
                                    </Form.Group>
                                    <Button variant="info" type="submit">Đăng bài</Button>
                                </Form>
                            </> : <>
                                <Form onSubmit={capnhat}>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Tiêu đề bài viết</Form.Label>
                                        <Form.Control type="text" onChange={(e) => change(e, "ten")} placeholder="Tiêu đề bài viết" required />
                                    </Form.Group>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Ngày đăng</Form.Label>
                                        <Form.Control type="date" disabled />
                                    </Form.Group>
                                    <Form.Group className="mb-3 group11">
                                        <Form.Label>Phạm vi cần tìm</Form.Label>
                                        <Form.Control type="text" onChange={(e) => change(e, "phamvi")} placeholder="Khu vực" required />
                                    </Form.Group>
                                    <Form.Group className="mb-3">

                                        <Form.Control type="file" hidden ref={hinhanh} value={null} />
                                    </Form.Group>
                                    <Form.Group className="mb-3">
                                        <Form.Label>Mô tả chi tiết</Form.Label>
                                        <Form.Control as="textarea" rows={5} onChange={(e) => change(e, "noidung")}  placeholder="Mô tả chi tiết" required />
                                    </Form.Group>
                                    <Button variant="info" type="submit">Đăng bài</Button>
                                </Form>
                            </>}
                        </div>
                    </div>
                    <div className="thtin-col2"></div>
                    <div className="thtin-col3">
                        <div className="thtin-tacgia">
                            <div className="tacgia-anh">
                                <img src={thtinbviet.idNguoiDung.avatar} />
                            </div>
                            <div className="tacgia-thongtin">
                                <center>
                                    <h4>{thtinbviet.idNguoiDung.tenNguoiDung}</h4>

                                    <h5>{thtinbviet.idNguoiDung.sdt}</h5>
                                </center>
                            </div>

                        </div>

                    </div>

                </div>

            </Container>


        </>

    );
}

export default CapNhatBV;