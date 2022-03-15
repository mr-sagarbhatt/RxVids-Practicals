import Link from "next/link";
import Head from "next/head";
import Layout from "../../components/Layout/layout";
import { getAllPostIds, getPostData } from "../../lib/posts";
import Date from "../../components/date";

// * 1: Component
const Post = ({ postData }) => {
  return (
    <Layout>
      <Head>
        <title>{postData.title}</title>
      </Head>
      <h1 className='my-4 text-3xl font-semibold text-pink-900'>
        {postData.title}
      </h1>
      <h3 className='my-1 text-2xl lowercase'>{postData.id}</h3>
      <h4 className='my-2'>
        <Date dateString={postData.date}></Date>
      </h4>
      <Link href='/'>
        <a className='my-10 font-extrabold text-yellow-900 underline uppercase underline-offset-8'>
          Back to Home 🏠
        </a>
      </Link>
    </Layout>
  );
};

// * 2: Return a list of possible value for id
// * If fallback is false, then any paths not returned by getStaticPaths will result in a 404 page.
// * If fallback is true, then the behavior of getStaticProps changes:
export async function getStaticPaths() {
  const paths = getAllPostIds();
  return {
    paths,
    fallback: false,
  };
}

// * 3: Fetch necessary data for the blog post using params.id
export async function getStaticProps({ params }) {
  const postData = getPostData(params.id);
  return {
    props: {
      postData,
    },
  };
}

export default Post;

// ? The page file must contain:
// * 1. A React component to render this page
// * 2. getStaticPaths which returns an array of possible values for id
// * 3. getStaticProps which fetches necessary data for the post with id
