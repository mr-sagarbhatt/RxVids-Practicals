import { route } from "next/dist/server/router";
import Link from "next/link";
import { useRouter } from "next/router";

const Header = () => {
  const router = useRouter();

  return (
    <nav className='py-4 pt-4 text-white bg-black md:text-2xl'>
      <ul className='flex gap-4 list-none place-content-center md:gap-8'>
        <li className={router.pathname == "/" ? "text-teal-400" : ""}>
          <Link href='/'>
            <a className='hover:text-teal-400'>Next-Practice</a>
          </Link>
        </li>
        <li
          className={
            router.pathname.includes("/project/") ? "text-teal-400" : ""
          }
        >
          <Link href='/project/widget'>
            <a className='hover:text-teal-400'>Project</a>
          </Link>
        </li>
      </ul>
    </nav>
  );
};

export default Header;
