// * For Client Navigation
import Link from "next/link";
// * For Images
import Image from "next/image";
// * For Metadata
import Head from "next/head";
// * For Loading third party Scripts
import Script from "next/script";
import Layout from "../components/Layout/layout";
import utilStyles from "../styles/utils.module.scss";
import { getSortedPostsData } from "../lib/posts";

export async function getStaticProps() {
  const allPostsData = getSortedPostsData();
  return {
    props: {
      allPostsData,
    },
  };
}

export default function Home({ allPostsData }) {
  return (
    <Layout>
      {/* // * styled-jsx */}
      {/* scoped styles */}
      <style jsx>{`
        p.scoped {
          display: none;
        }
      `}</style>
      {/* global styles */}
      {/* <style global jsx>{`
        body {
          color: blue;
        }
      `}</style> */}
      <p className='scoped'>scoped style</p>
      <Head>
        <title>Home Page</title>
        <meta
          name='description'
          content='Learn how to build a personal website using Next.js'
        />
        <meta name='og:title' content='Home Page' />
        <meta name='twitter:card' content='summary_large_image' />
      </Head>
      {/*
      *** `strategy` controls when the third-party script should load. A value of
      `lazyOnload` tells Next.js to load this particular script lazily during
      browser idle time.
      *** `onLoad` is used to run any JavaScript code immediately
      after the script has finished loading.
      */}
      <Script
        src='https://your-site-or-cdn.com/fontawesome/v6.0.0/js/all.js'
        strategy='lazyOnload'
        onLoad={() => {
          console.log("Font awesome script loaded.");
        }}
      />
      <h1 className={utilStyles.heading2Xl}>Home Page 🏠</h1>
      <Image
        src='/assets/images/profile.jpg'
        className={utilStyles.borderCircle}
        height={200}
        width={200}
        alt='profile'
      />
      <h2>
        <Link href='/posts/first-post/'>
          <a>Go to first-post ➡️</a>
        </Link>
      </h2>

      <section className={`${utilStyles.headingMd} ${utilStyles.padding1px}`}>
        <h2 className={utilStyles.headingLg}>Blog using getStaticProps()</h2>
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
}
