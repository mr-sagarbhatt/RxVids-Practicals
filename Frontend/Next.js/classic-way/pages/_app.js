import "../styles/globals.css";
import Layout from "../components/Layout/layout";
import Header from "../components/Header/header";

function MyApp({ Component, pageProps }) {
  return (
    <>
      <Header></Header>
      <hr />
      <Component {...pageProps} />
    </>
  );
}

export default MyApp;
