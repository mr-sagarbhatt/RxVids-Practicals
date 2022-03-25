import "./App.css";
import Header from "./components/Header/Header";
import Home from "./pages/Home/Home";
import Widgets from "./pages/Widgets/Widgets";

import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

function App() {
  return (
    <>
      <Router>
        <Header></Header>
        <Routes>
          <Route path='/' element={<Home></Home>} />
          <Route path='widgets' element={<Widgets></Widgets>} />
        </Routes>
      </Router>
    </>
  );
}

export default App;
