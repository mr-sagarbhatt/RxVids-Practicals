# Next JS

> Next.js is a React framework that gives you building blocks to create web applications. \
> provides additional structure, features, and optimizations for your application. \
> You can use React to build your UI, then incrementally adopt Next.js features to solve common application requirements such as routing, data fetching, integrations - all while improving the developer and end-user experience.

# How Next.js Works

> Next.js provides features for both the development and production stages of an application. \
> compilation happens during the development stage as you edit your code, and as part of the build step to prepare your application for production. \
> Minification is the process of removing unnecessary code formatting and comments without changing the code’s functionality. The goal is to improve the application’s performance by decreasing file sizes. \
> Bundling is the process of resolving the web of dependencies and merging (or ‘packaging’) the files (or modules) into optimized bundles for the browser, with the goal of reducing the number of requests for files when a user visits a web page. \
> Next.js has built-in support for code splitting. Each file inside your pages/ directory will be automatically code split into its own JavaScript bundle during the build step. \
> Build time (or build step) is the name given to a series of steps that prepare your application code for production. \
> Runtime (or request time) refers to the period of time when your application runs in response to a user’s request, after your application has been built and deployed. \
> There is an unavoidable unit of work to convert the code you write in React into the HTML representation of your UI. This process is called rendering. \
> With Next.js, three types of rendering methods are available: Server-Side Rendering and Static Site Generation, and Client-Side Rendering.
> Server-Side Rendering and Static Site Generation are also referred to as Pre-Rendering because the fetching of external data and transformation of React components into HTML happens before the result is sent to the client. \
> In a standard React application, the browser receives an empty HTML shell from the server along with the JavaScript instructions to construct the UI. This is called client-side rendering because the initial rendering work happens on the user's device. \
> In contrast, Next.js pre-renders every page by default. Pre-rendering means the HTML is generated in advance, on a server, instead of having it all done by JavaScript on the user's device. \
> With server-side rendering, the HTML of the page is generated on a server for each request. \
> With Static Site Generation, the HTML is generated on the server, but unlike server-side rendering, there is no server at runtime. Instead, content is generated once, at build time, when the application is deployed and the HTML is stored in a CDN and re-used for each request.

# Next.js aims to have best-in-class developer experience and many built-in features, such as:

> An intuitive page-based routing system (with support for dynamic routes) \
> Pre-rendering, both static generation (SSG) and server-side rendering (SSR) are supported on a per-page basis \
> Automatic code splitting for faster page loads \
> Client-side routing with optimized prefetching \
> Built-in CSS and Sass support, and support for any CSS-in-JS library \
> Development environment with Fast Refresh support \
> API routes to build API endpoints with Serverless Functions \
> Fully extendable

---

# Install Next.js

## We can choose 2 routes now:

### 1: using create-next-app

> npx create-next-app [my-app]

### 2: the classic approach which involves installing and setting up a Next app manually.

> #### Initialize your node project
>
> > npm init -y

> #### Install Dependencies
>
> > npm i react react-dom next

> #### Create pages/index.js folder

# Run the development server

> npm run dev

# Navigate Between Pages

> In Next.js, a page is a React Component exported from a file in the pages directory. \
> Pages are associated with a route based on their file name. \
> For example, in development:
>
> > pages/index.js is associated with the / route. \
> > pages/posts/first-post.js is associated with the /posts/first-post route.

# Link Component

> In Next.js, you use the Link Component from next/link to wrap the <a> tag. <Link> allows you to do client-side navigation to a different page in the application.
