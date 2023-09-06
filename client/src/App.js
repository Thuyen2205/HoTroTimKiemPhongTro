import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./layout/Header";
import Footer from "./layout/Footer";
import TrangChu from "./components/TrangChu";
import DangNhap from "./components/DangNhap"
import { Container } from "react-bootstrap";
import 'bootstrap/dist/css/bootstrap.min.css';
import ThTinBViet from "./components/BaiViet/ThTinBViet";
import { createContext, useReducer } from "react";
import MyUserReducer from "./reducers/MyUserReducer";
import cookie from "react-cookies";
import DangKy from "./components/DangKy";
import ThTinNgDung from "./components/TrangCaNhan/TrangCaNhan";
import BaiVietNgDung from "./components/BaiViet/BaiVietNgDung";
import DangBai from "./components/DangBai/DangBai";
import CapNhatBV from "./components/DangBai/CapNhapBV";
import DoiMatKhau from "./components/DoiMatKhau";


export const MyUserContext = createContext();


const App = () => {
    const [user, dispatch] = useReducer(MyUserReducer, cookie.load("user")||null);

    return (
        <>
        <MyUserContext.Provider value={[user, dispatch]}>
            <BrowserRouter>
                <Header />
                <Container>
                    <Routes>
                        <Route path="/" element={<TrangChu />} />
                        <Route path="/dangnhap" element={<DangNhap />} />
                        <Route path="/dangky" element={<DangKy />} />
                        <Route path="/thtin_bviet/:id" element={<ThTinBViet />} />
                        <Route path="/thtin-ngdung/:id" element={<ThTinNgDung />}/>
                        <Route path="/bviet-ngdung/:id" element={<BaiVietNgDung />}/>
                        <Route path="/dangbai/" element={<DangBai /> }/>
                        <Route path="/capnhatbv/:id" element={<CapNhatBV/> }/>
                        <Route path="/doimatkhau" element={<DoiMatKhau />} />
                        {/* <Route path="/timkiem" element={<TimKiem/>}/> */}
                    </Routes>
                </Container>
                <Footer />
            </BrowserRouter>
        </MyUserContext.Provider>
        </>
    )
}
export default App;