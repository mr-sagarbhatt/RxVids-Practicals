import { NavLink } from "react-router-dom";
const Header = () => {
  return (
    <nav className='p-4 text-xl text-white bg-black'>
      <ul className='flex flex-wrap gap-4 lg:gap-8 place-content-center'>
        <li className='cursor-pointer hover:text-teal-300'>
          <NavLink to='/' className='text-teal-300'>
            Home
          </NavLink>
        </li>
        <li className='cursor-pointer hover:text-teal-300'>
          <NavLink to='/widgets' className='text-teal-300'>
            Widgets
          </NavLink>
        </li>
      </ul>
    </nav>
  );
};

export default Header;
