import { NavLink } from "react-router-dom";
const Header = () => {
  return (
    <nav className='p-4 text-xl text-white bg-neutral-800'>
      <ul className='flex flex-wrap gap-4 lg:gap-8 place-content-center'>
        <li className='cursor-pointer hover:text-teal-300'>
          <NavLink
            to='/'
            className={({ isActive }) =>
              isActive ? "text-teal-300" : "text-white"
            }
          >
            Home
          </NavLink>
        </li>
        <li className='cursor-pointer hover:text-teal-300'>
          <NavLink
            to='/widgets'
            className={({ isActive }) =>
              isActive ? "text-teal-300" : "text-white"
            }
          >
            Widgets
          </NavLink>
        </li>
      </ul>
    </nav>
  );
};

export default Header;
