import { useContext, useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Apis, { endpoints } from "../../configs/Apis";
import { Image, Table } from "react-bootstrap";
import MySpinner from "../../layout/MySpinner";
import { MyUserContext } from "../../App";
import "../TrangCaNhan/TrangCaNhan.scss";


const BaiVietNgDung = ({ idNgdung }) => {
    const [bvietngdung, setBvietngdung] = useState(null);
    const [user] = useContext(MyUserContext);
    const [listComment, setListCmt] = useState([]);

    useEffect(() => {

        const loadBvietngdung = async () => {
            let { data } = await Apis.get(endpoints['bviet-ngdung'](idNgdung));
            setBvietngdung(data);
        }
        loadBvietngdung();

    }, [idNgdung]);

    const deleteBaiViet = async (baiVietId) => {
        try {
            // Send an API request to delete the baiViet
            await Apis.delete(endpoints['xoabv'](baiVietId));
            
            // Update the bvietngdung state by removing the deleted baiViet
            setBvietngdung((prevBvietngdung) => prevBvietngdung.filter((c) => c.id !== baiVietId));
        } catch (error) {
            console.error("Error deleting baiViet: ", error);
        }
    };

    if (!bvietngdung)
        return <MySpinner />;
    return (
        <>
            <div className="tincanhan">
                {bvietngdung.map(c => {
                    return <>
                        <div className="tin">
                            <div className="tin-anh">
                                <Image src={c.hinhAnh} style={{ width: '100%', margin:'auto 0' }}></Image>
                            </div>
                            <div className="tin-thongtin">
                                <h5><Link style={{ textDecoration: 'none' }} className='text-danger' to={`/thtin_bviet/${c.id}`}>{c.tenBaiViet}</Link></h5>
                                <Table >
                                    <tr>
                                        <th>Khu vực</th>
                                        <td>{c.phamViCanTim}</td>
                                    </tr>
                                    <tr>
                                        <th>Giá thuê</th>
                                        <td>{c.giaThue}</td>
                                    </tr>
                                    <tr>
                                        <th>Ngày đăng</th>
                                        <td>{c.ngayDang}</td>
                                    </tr>
                                    <tr>
                                        <th>Địa chỉ</th>
                                        <td>{c.diaChiCt}</td>
                                    </tr>
                                </Table>
                                <div className="">

                                    <button className="btn btn-success" style={{margin: '5px', padding:'5px', borderRadius:'5px', width:'50%'}}><Link style={{ textDecoration: 'none' , color:'white'}} to={`/capnhatbv/${c.id}`}>Cập nhật bài viết</Link></button>
                                    <button className="btn btn-danger" style={{margin: '5px', padding:'5px', borderRadius:'5px', width:'20%', color:'white'}} onClick={() => deleteBaiViet(c.id)}>Xóa</button>
                                </div>
                            </div>
                        </div>
                    </>
                })}
                <div>
                </div>
            </div>
        </>
    );
}

export default BaiVietNgDung;