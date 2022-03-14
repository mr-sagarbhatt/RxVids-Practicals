import Link from "next/link";

const FirstPost = () => {
  return (
    <>
      <h1>first-post</h1>
      <h2>
        <Link href='/'>
          <a>Back to home</a>
        </Link>
      </h2>
    </>
  );
};

export default FirstPost;
