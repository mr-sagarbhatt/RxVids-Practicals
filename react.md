# React:

> A javascript library for building user interfaces\
> Developed By Facebook 2011\
> Components: User Interface\
> Root Component, Component Tree\
> Independence\
> Reusability\
> Speed

> ## Virtual DOM:
>
> Rerender a particular component not whole application
>
> ## Install React:
>
> npm install -g create-react-app
>
> ## Create React App(new project):
>
> npx create-react-app projectName
>
> ## Setup server(run):
>
> npm start
>
> ## Build app for production:
>
> npm build

# Components:

> Components are like functions that return HTML elements.
>
> ## 2 types of components:
>
> Stateless Functional components: return JSX, need to return at least one element or empty element else gives an error
> Class components: Call render() method that returns JSX

# JSX:

> JSX allows us to write HTML elements in JavaScript and place them in the DOM without any createElement() and/or appendChild() methods.
> JSX converts HTML tags into react elements.

    // ? JSX RULES
    // * return single element
    // * div / section / article or React.Fragment
    // * use camelCase for html attributes
    // * use className attribute instead of class
    // * must close every element

# CSS:

> External: import .css file using import statement -> import "./index.css"
> Internal: define style attribute -> style={} or define object for style and call it -> style{authorStyle}

# JavaScript in JSX

> Interpolation({}) is used to run JS in JSX

# Props (properties):

> Arguments to Component, parameter type: object
> Children Prop: access using children property
> Props Destructuring

# Import/Export

> ## 2 types:
>
> ## 1) named import/exports
>
> ### export
>
> export individually: Ex:\
> export const name = "sagar";\
> export const age = 23;\
> or\
> export all at once: Ex:\
> export { name, age }
>
> ### import:
>
> use destructuring: Ex:\
> import { name, age, person } from "./3-data";\
> or\
> use alias: Ex:\
> import \* as data from "./3-data";
>
> ## 2) default import/exports :: only one default export per module(file)\
>
> EX: export default App;\

# Class Based Component

> Using class components we can do all the same things we were doing with stateless functional components\
> 2 other things state, life cycle methods\
> React Hooks: let you use state and other React features without writing a class.\
> ES6 Classes - Syntactical Sugar for Constructor Functions\
> Class should be a subclass of Component\
> to inherits functionality\
> So extends from Component Class\
> Component class is used to transfer from basic E6 class to component class

# State

> can control how data would be rendered and manipulate(add, modify, delete)\
> state, this.setState = hold, access, change data of component\
> props = read only\
> In class components props are used with: this.props\
>
> ## There are 2 ways(syntax) to use state
>
> 1.  state property of class :: EX:
>     state = {
>     books: booksData,
>     };
>
> 2.  constructor -> this.state :: EX:
>     constructor(props) {
>     super(props);
>     this.state = {
>     books: booksData,
>     };
>     }
>     this.setState() :: change state value, we can not change state value directly else it will not re-rendered

# Events :: 2 ways to handle events

> 1. Using Normal Function :: here we need to bind this in constructor
> 2. Using Arrow Function :: here we doesn't need to bind this in constructor

# PROP DRILLING

> PASSING METHOD FROM PARENT TO CHILD COMPONENT :: We passed it as props

# Conditional Rendering

> ### 3 ways
>
> 1. and operator :: Inline If with Logical && Operator
> 2. ternary operator :: Inline If-Else with Conditional Operator
> 3. separate function

# PropTypes

> install module prop-types -> npm i prop-types\
> import as :: import PropTypes from "prop-types";\
> built in type checking to validate props\
> types :: array, bool, func, number, object, string, symbol\
> If props not passed at all? :: isRequired, defaultProps\
> defaultProps :: default valued for the props\
> Object with particular :: define shape of an object

# Forms

> ## 2 types of inputs:
>
> ### 1. Controlled Input :: form data is handled by a React component.
>
> set value in state, onChange event\
> Handle multiple input fields :: 2 ways
>
> 1. Input name and state name can be different
> 2. Input name and state name must be same
>
> ### 2. Uncontrolled Inputs: (References) :: form data is handled by the DOM
>
> Refs provide a way to access DOM nodes or React elements created in the render method.\
> Refs are created using React.createRef() and attached to React elements via the ref attribute.\
> Accessing Refs :: using current attribute\
> Callback Refs :: Instead of passing a ref attribute created by createRef(), you pass a function. The function receives the React component instance or HTML DOM element as its argument, which can be stored and accessed elsewhere.

# React Fragment

> React Fragment and this.setState() is asynchronous\
> this.setState(object) vs this.setState(function) ::\
> this.setState(object) :: It takes state object\
> this.setState(function) :: It takes a function that return state object

---

# external packages

> ## <ins>[Routing](https://www.youtube.com/watch?v=Jppuj6M1sJ4&t=1s)<ins>
>
> Create different routes for different pages in react.\
> module :: npm i react-router-dom\
> Classes :: <BrowserRouter />, <Routes />, <Route />, <Link />, <Outlet />\
> BrowserRouter :: It is the parent component that is used to wrap all of the other components.\
> Rotes :: It???s a new component introduced in the v6 which wrap all route.\
> Route :: render components when its path matches the current URL\
> Link :: Link component is used to create links to different routes and implement navigation around the application. It works like HTML <a></a> tag.\
> Outlet :: render the child Routes to a parent Route.\
> Different Hooks :: useParams, useLocation, useNavigate\
> Features:\
> Params: Fetch params from url\
> Query :: Fetch query string in form of variable from url\
> Navigate/Redirect :: navigate to different page programmatically\
> Nesting :: nest route of a page in another page :: using <Route/> and <Outlet/>\
>
> ## Auth Guard ::
>
> ## Styled Component
>
> package :: npm i styled-components\
> components :: styled, ThemeProvider, createGlobalStyle\
> ->enhance CSS for styling React component systems\
> ->we can use nesting, props and themes, global styles
>
> ## <ins>[Rect icons](https://react-icons.github.io/react-icons/)</ins>
>
> package :: npm i react-icons
>
> ## <ins>[UUID :: Unique Id's](https://www.npmjs.com/package/uuid)</ins>
>
> package :: npm i uuid
>
> ## <ins>[axios](https://www.npmjs.com/package/axios)</ins>
>
> package :: npm i axios
>
> ## <ins>[zxcvbn](for Password strength)</ins>
>
> firebase: for social media authentication
>
> ## <ins>[Contentful](https://contentful.github.io/contentful.js/contentful/9.1.5/)</ins>
>
> headless CMS :: store website content\
> package :: npm i contentful

# <ins>[.env file](https://create-react-app.dev/docs/adding-custom-environment-variables/)</ins>

> ->create a .env file at the root directory of your application and add the variables to it.\
> ->variable needs to start with REACT_APP for it to work.\
> ->Restart your App and Finally, add .env to your .gitignore file so that Git ignores it and it never ends up on GitHub.

---

# <ins>[React Component Life Cycle](https://www.w3schools.com/react/react_lifecycle.asp)</ins>

> ->Available on class components :: Functional components useEffect hook is partially related to these methods\
> ->The series of events that happens from the mounting of a react component to its unmounting.\
> Mounting :: creation of component\
> componentDidMount() : runs after the component output has been rendered to the DOM, used when we Fetch data from api\
> Update :: updating of component\
> componentDidUpdate() : invoked as soon as the updating happens, updating the DOM response to prop or state changes\
> Unmounting :: deletion of component\
> componentDidUnmount() : called before the component is unmounted or destroyed.\
> \
> render() ::\
> ->The render() method is required for a class based component to render component\
> ->Runs during the mounting and updating of your component.

# Context API ::

> Allow us to pass data without using prop drilling(pass data from parent to child using props)\
> React context API allows us to easily access data at different levels of the component tree, without passing prop to every level. 1) createContext() :: create a context 2) provider > :: allow components to use context 3) consumer :: use the context

#Hooks ::

> Hooks are a new addition in React 16.8. They let you use state and other React features without writing a class.\
> A Hook is a special function that lets you ???hook into??? React features.
>
> useState :: useState is a Hook that lets you add React state to function components.\
> ->What does useState return? It returns a pair of values: the current state and a function that updates it.\
> ->similar to this.state.count and this.setState in a class, except you get them in a pair.\
> // \* useState() :: returns 2 values :: 1.actual value of state, 2.function for update the value
>
> useEffect ::
> useEffect let's perform side effects\
> runs after every render\
> react re-renders when state or props has changed\
> first parameter :: callback function(runs after render)\
> second parameter :: array - for letting react know when to run useEffect
>
> useContext ::
> React Context is a way to manage state globally.\
> It can be used together with the useState Hook to share state between deeply nested components more easily than with useState alone.
>
> React Custom Hooks ::
> Hooks are reusable functions.\
> When you have component logic that needs to be used by multiple components, we can extract that logic to a custom Hook.\
> Custom Hooks start with "use". Example: useFetch.

---

# REACT JS CLEAN CODE PRACTICES: (Use ES6 Conventions) ::

> ->Use Arrow Functions\
> ->No return keyword :: Use implicit return\
> ->Using less brackets\
> ->Distribute the app in different react components\
> ->Use destructuring of props\
> ->Use fragments\
> ->Destructure array of objects in map function\
> ->Use optional chaining (?) instead of condition (&&)
