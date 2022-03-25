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
import { useState } from "react";

// * to fetch necessary data
export async function getStaticProps() {
  const allPostsData = getSortedPostsData();
  return {
    props: {
      allPostsData,
    },
  };
}

export default function Home({ allPostsData }) {
  const [users, setUsers] = useState([]);
  {
    /* // * GET :: Fetch data from API */
  }
  const fetchData = async () => {
    const response = await fetch("/api/user");
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    const users = await response.json();
    return setUsers(users);
  };

  {
    /* // * POST */
  }
  const postData = async () => {
    const response = await fetch("/api/user", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        id: 3,
        firstName: "Beyoncé",
        middleName: "Giselle",
        lastName: "Knowles-Carter",
        age: 40,
      }),
    });
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    const users = await response.json();
    return setUsers(users);
  };

  return (
    <Layout className='h-screen'>
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
        src='/assets/images/download.jpeg'
        className={utilStyles.borderCircle}
        height={200}
        width={200}
        alt='profile'
      />
      <h2 className='flex flex-col gap-4 my-4'>
        <Link href='/posts/first-post/'>
          <a>Go to /posts/first-post/ ➡️</a>
        </Link>
        <Link href='/tailwind/tailwind/'>
          <a>Go to tailwind/tailwind/ ➡️</a>
        </Link>
        <Link href='/posts/ssg-ssr'>
          <a>Go to /posts/ssg-ssr/ ➡️</a>
        </Link>
        <Link href='/posts/pre-rendering'>
          <a>Go to /posts/pre-rendering/ ➡️</a>
        </Link>
        <Link href='/api/hello/'>
          <a>Go to /api/hello/ ➡️</a>
        </Link>
        <Link href='/api/user/'>
          <a>GO to /api/user/ ➡️</a>
        </Link>
      </h2>

      <section
        className={`${utilStyles.headingMd} ${utilStyles.padding1px} mt-10`}
      >
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

      <section className='mt-8'>
        <button
          className='p-3 text-white bg-black border rounded-lg'
          onClick={postData}
        >
          Create Users
        </button>

        {/* // * GET :: Fetch data from API */}
        <button
          className='p-3 text-white bg-black border rounded-lg'
          onClick={fetchData}
        >
          Fetch Users
        </button>
        <button
          className='p-3 text-white bg-black border rounded-lg'
          onClick={() => setUsers([])}
        >
          Clear Users
        </button>
        <div>
          {users.length > 0 && (
            <table className='m-4 text-center'>
              <thead>
                <th>Id</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Age</th>
              </thead>
              <tbody>
                {users.map((user) => {
                  return (
                    <tr key={user.id}>
                      <td>{user.id}</td>
                      <td>{user.firstName}</td>
                      <td>{user.middleName}</td>
                      <td>{user.lastName}</td>
                      <td>{user.age}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          )}
        </div>
      </section>
      <div className='mb-56'></div>
    </Layout>
  );
}
