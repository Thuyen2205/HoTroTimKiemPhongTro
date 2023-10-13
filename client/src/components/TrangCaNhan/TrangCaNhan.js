import { useContext, useEffect, useState } from "react";
import {Link, useParams } from "react-router-dom";
import Apis, { endpoints } from "../../configs/Apis";
import { Button, Container, Image } from "react-bootstrap";
import MySpinner from "../../layout/MySpinner";
import "./TrangCaNhan.scss";
import { MyUserContext } from "../../App";
import BaiVietNgDung from "../BaiViet/BaiVietNgDung";

const ThTinNgDung = () => {
    const [user] = useContext(MyUserContext);
    const [thtinngdung, setThtinNgdung] = useState(null);
    const { id } = useParams();

    useEffect(() => {

        const loadThtinNgdung = async () => {
            let { data } = await Apis.get(`${endpoints['thtin-ngdung']}${user.id}`);
            setThtinNgdung(data);
            console.log(data);
        }

        loadThtinNgdung();

    }, [id]);


    if (!thtinngdung)
        return <MySpinner />;
    return (
        <>
            <Container>
                <div className="trangcanhan">
                    <div className="col11">
                        <center><div className="phanngang"><strong>THÔNG TIN CÁ NHÂN</strong></div></center>
                        <div className="thtincanhan">
                            <div className="thtincanhan-anh">
                                <center><Image style={{height:'90px', width:'90px', borderRadius:'45px'}}  src={thtinngdung.avatar} />  </center>
                            </div>
                            <center>
                                <h5 style={{marginTop:'10px'}}>{thtinngdung.idLoaiTaiKhoan.tenLoaiTaiKhoan}</h5>
                                <p>{thtinngdung.tenNguoiDung}</p>
                                <p>{thtinngdung.sdt}</p>
                                <div className="buttoncanhan">
                                    <Button style={{width:'40%', fontSize:'17px'}} >Cập nhật</Button>
                                    <button style={{backgroundColor:"#005555"}}><Link style={{textDecoration:'none', color:'white'}} to="/doimatkhau">Đổi mật khẩu</Link></button>
                                </div>
                            </center>
                        </div>
                    </div>
                    <div className="col12"></div>
                    <div className="col13">
                        <div className="phanngang"><strong>TIN ĐĂNG CÁ NHÂN</strong></div>                        
                        <BaiVietNgDung idNgdung={user.id}/>
                    </div>
                </div>
            </Container>
        </>
    );
}

export default ThTinNgDung;