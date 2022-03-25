import Link from "next/link";
import { useRouter } from "next/router";

const ProjectContainer = ({ children }) => {
  const router = useRouter();

  return (
    <article className='flex flex-col gap-5 p-8 bg-neutral-200 md:flex-row'>
      <section className='flex flex-col p-4 text-center bg-white rounded-md'>
        <ul className='flex flex-wrap gap-4 text-lg place-items-center md:flex-col'>
          <li
            className={`p-3 border border-neutral-300 rounded-lg ${
              router.pathname === "/project/widget" ? "bg-teal-300" : ""
            }`}
          >
            <Link href='/project/widget/'>
              <a className='text-lg rounded-lg'>Widget</a>
            </Link>
          </li>
          <li
            className={`p-3 border border-neutral-300 rounded-lg ${
              router.pathname === "/project/website" ? "bg-teal-300" : ""
            }`}
          >
            <Link href='/project/widget/'>
              <a className='text-lg rounded-lg'>website</a>
            </Link>
          </li>
        </ul>
      </section>
      <section className='p-4 bg-white rounded-md md:w-screen'>
        {children}
      </section>
    </article>
  );
};

export default ProjectContainer;
