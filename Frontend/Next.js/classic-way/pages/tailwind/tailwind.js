import Head from "next/head";
import Image from "next/image";
import Link from "next/link";

const Tailwind = () => {
  return (
    <>
      <Head>
        <title>Tailwind CSS</title>
      </Head>
      <div className='flex flex-col items-center justify-center max-w-sm p-6 mx-auto my-4 space-x-4 overflow-x-auto text-center bg-white shadow-lg rounded-xl sm:flex-row sm:bg-slate-300 md:bg-red-200 lg:bg-orange-200 xl:bg-amber-200 2xl:bg-yellow-200 3xl:bg-purple-100'>
        <div className='shrink-0'>
          <Image
            className='rounded-full'
            src='/assets/images/download.jpeg'
            height='100'
            width='100'
            alt='Logo'
          />
        </div>
        <div>
          <div className='text-xl font-medium text-black'>ChitChat</div>
          <p className='text-slate-500'>You have a new message!</p>
        </div>
      </div>
      <h2 className='grid my-4 place-content-center'>
        <Link href='/'>
          <a>Back to Home 🏠</a>
        </Link>
      </h2>
    </>
  );
};

export default Tailwind;
