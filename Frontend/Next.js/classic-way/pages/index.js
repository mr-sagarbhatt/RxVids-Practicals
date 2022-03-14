import Head from "next/head";
import Image from "next/image";
import styles from "../styles/Home.module.css";
import Link from "next/link";

export default function Home() {
  return (
    <>
      <h1>Home Page</h1>
      <h2>
        <Link href='/posts/first-post/'>
          <a>Redirect to first-post</a>
        </Link>
      </h2>
    </>
  );
}
