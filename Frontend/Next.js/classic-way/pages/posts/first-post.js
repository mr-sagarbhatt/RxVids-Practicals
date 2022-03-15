import Link from "next/link";
import Image from "next/image";
import Head from "next/head";
import Layout from "../../components/Layout/layout";
import utilStyles from "../../styles/utils.module.scss";
import { getSortedPostsData } from "../../lib/posts";

// * to fetch necessary data
export async function getServerSideProps() {
  const allPostsData = getSortedPostsData();
  return {
    props: {
      allPostsData,
    },
  };
}

const FirstPost = ({ allPostsData }) => {
  return (
    <Layout>
      <Head>
        <title>First Post</title>
      </Head>
      <h1 className={utilStyles.heading2Xl}>First Post</h1>
      <Image
        src='/assets/images/download.jpeg'
        className={`${utilStyles.borderCircle}`}
        height={144}
        width={144}
        alt='post-1'
      />
      <h2 className='mt-8 text-xl'>
        <Link href='/'>
          <a>Back to home 🏠</a>
        </Link>
      </h2>
      <section
        className={`${utilStyles.headingMd} ${utilStyles.padding1px} mt-8`}
      >
        <h2 className={utilStyles.headingLg}>
          Blog using getServerSideProps()
        </h2>
        <ul className={utilStyles.list}>
          {allPostsData.map(({ id, date, title }) => (
            <li className={utilStyles.listItem} key={id}>
              {title}
              <br />
              {id}
              <br />
              {date}
            </li>
          ))}
        </ul>
      </section>
    </Layout>
  );
};

export default FirstPost;
