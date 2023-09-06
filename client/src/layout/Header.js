import { useContext } from "react";
import { Button, Container, Nav, Navbar } from "react-bootstrap";
import { Link } from "react-router-dom";
import { MyUserContext } from "../App";
import "./style.scss";

const Header = () => {
    const [user, dispatch] = useContext(MyUserContext);
    const logout = () => {
        dispatch({
            "type": "logout",
        })
    }
    // if(user!==null)
    //     return     console.log(user.tenTaiKhoan);


    return (
        <Navbar expand="lg" className="bg-body-tertiary">
            <Container>
                <Navbar.Brand href="#home">MY WEBSITE</Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="me-auto">
                        <Link to="/" className="nav-link">TRANG CHỦ</Link>

                        {user === null ? <>
                            <Link to="/dangnhap" className="nav-link text-danger">ĐĂNG NHẬP</Link>
                            <Link to="/dangky" className="nav-link text-danger">ĐĂNG KÍ</Link>
                        </>:<>
                                <Link className="nav-link text-danger" to="/">Chào {user.tenTaiKhoan}</Link>
                                <Link className="nav-link text-danger" to={`/thtin-ngdung/${user.id}`}>TRANG CÁ NHÂN</Link>
                                <Link className="nav-link text-danger" to="/dangbai/">ĐĂNG BÀI</Link>
                                <Button variant="secondary"  onClick={logout}><Link className="logout" to="/">Đăng xuất</Link></Button>

                        </>
                        }

                    </Nav>
                </Navbar.Collapse>
            </Container>
        </Navbar>)
}
export default Header;