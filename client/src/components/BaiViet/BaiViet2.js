import { useEffect, useState } from "react";
import { Container, Image, Table } from "react-bootstrap";
import MySpinner from "../../layout/MySpinner";
import Apis, { endpoints } from "../../configs/Apis";
import "./BViet.scss"
import { Link } from "react-router-dom";
import { MyUserContext } from "../../App";
import { Pagination } from "@mui/material";

const BaiViet2 = () => {
    const [baiviet2, setBaiViet2] = useState(null);
    const [page, setPage] = useState(1);
    const [start, setStart] = useState('');
    const PAGE_SIZE = 2;

    useEffect(() => {
        let loadBaiviet2 = async () => {
            try {
                let res = await Apis.get(endpoints['baiviet2']);
                setBaiViet2(res.data);
            } catch (ex) {
                console.error(ex);
            }
        }

        loadBaiviet2();
    }, []);

    useEffect(() => {
        setStart((page - 1) * PAGE_SIZE)
    }, [page])

    if (baiviet2 === null)
        return <MySpinner />
    return (
        <body className="body">
            <>
                <h3 className="text-center text-danger">DANH MỤC TIN TÌM TRỌ <strong>MỚI NHẤT</strong></h3>
                <Container style={{ marginTop: '15px' }} className="container-bv">

                    {baiviet2.slice(start, start + PAGE_SIZE).map(p => {
                        return <>
                            <div className="itembv">
                                <div className="itembv-anh">
                                    <Image src='https://res.cloudinary.com/dpp5kyfae/image/upload/v1694280790/timtro2_k6dbqd.jpg'></Image>
                                </div>
                                <div className="itembv-thtin">
                                    <h5 style={{ textTransform: 'uppercase' }}><Link style={{ textDecoration: 'none', color: '#005555' }} to={`/thtin_bviet/${p.id}`}>{p.tenBaiViet}</Link></h5>

                                    <Table >
                                        <tr>
                                            <th>Khu vực:</th>
                                            <td>{p.phamViCanTim}</td>
                                        </tr>

                                    </Table>
                                    <div className="btn-docthem">
                                        <button style={{ width: '60%', padding: '5px', borderRadius: '8px', backgroundColor: '#005555', fontSize: '17px' }}><Link style={{ textDecoration: 'none', color: 'white' }} to={`/thtin_bviet/${p.id}`}>Đọc thêm</Link></button>
                                    </div>
                                </div>
                            </div>

                        </>


                    })}
                    <div className="ChangePage">
                        <Pagination
                            count={Math.ceil(baiviet2.length / PAGE_SIZE)}
                            showFirstButton
                            showLastButton
                            onChange={(e, p) => setPage(p)}
                        />
                    </div>
                </Container>

            </>
        </body>
    )

}
export default BaiViet2;