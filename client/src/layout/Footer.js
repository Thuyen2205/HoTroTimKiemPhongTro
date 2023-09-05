import React from 'react';
import { Container } from 'react-bootstrap';

const Footer = () => {
    return (
        <div bgColor="light" className='text-center text-lg-left footer'> 
            <div className='text-center p-3' style={{ backgroundColor: 'rgba(0, 0, 0, 0.2)' }}>
                &copy; {new Date().getFullYear()} Copyright:{' '}
                <a className='text-dark'>
                    Phat-Thuyen
                </a>
            </div>
        
       </div>
    )

}
export default Footer;
