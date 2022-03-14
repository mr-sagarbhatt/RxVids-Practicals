import Image from "next/image";
const Tailwind = () => {
  return (
    <>
      <div className='flex items-center max-w-sm p-6 mx-auto space-x-4 bg-white shadow-lg rounded-xl'>
        <div className='shrink-0'>
          <Image
            className=''
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
    </>
  );
};

export default Tailwind;
