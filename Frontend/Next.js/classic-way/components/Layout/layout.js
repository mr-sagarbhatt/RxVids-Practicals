import styles from "./layout.module.scss";

const Layout = ({ children, home }) => {
  return <div className={styles.container}>{children}</div>;
};

export default Layout;
