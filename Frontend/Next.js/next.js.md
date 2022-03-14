# Next JS

> Next.js is a React framework that gives you building blocks to create web applications. \
> provides additional structure, features, and optimizations for your application. \
> You can use React to build your UI, then incrementally adopt Next.js features to solve common application requirements such as routing, data fetching, integrations - all while improving the developer and end-user experience.

# [How Next.js Works](https://nextjs.org/learn/foundations/how-nextjs-works)

# [Next.js aims to have best-in-class developer experience and many built-in features, such as:](https://nextjs.org/learn/basics/create-nextjs-app)

---

# Install Next.js

## We can choose 2 routes now:

### 1: using create-next-app

```
npx create-next-app [my-app]
```

### 2: the classic approach which involves installing and setting up a Next app manually.

> #### Initialize your node project

```
npm init -y
```

> #### Install Dependencies

```
npm i react react-dom next
```

> #### [Pages Directory :: next.js handles routing using pages](https://nextjs.org/learn/basics/navigate-between-pages/pages-in-nextjs)
>
> Create pages/index.js folder :: Home page :: default route is "/" \
> All pages must be exported as default

# Run the development server

```
npm run dev
```

# Navigate Between Pages

> In Next.js, a page is a React Component exported from a file in the pages directory. \
> Pages are associated with a route based on their file name. \
> For example, in development:
>
> > pages/index.js is associated with the / route. \
> > pages/posts/first-post.js is associated with the /posts/first-post route.

# [Link Component](https://nextjs.org/learn/basics/navigate-between-pages/client-side)

```
import Link from 'next/link'
```

> In Next.js, you use the Link Component from next/link to wrap the <a></a> tag. <Link> allows you to do client-side navigation to a different page in the application. \
> the Link component is similar to using <a></a> tags, but instead of <a href="…"></a>, you use <Link href="…"> and put an <a></a> tag inside. \
> If you need to link to an external page outside the Next.js app, just use an <a></a> tag without Link

# Assets, Metadata, and CSS

> Next.js handles static assets like images and page metadata like the <title></title> tag. \
>
> > How to add static files (images, etc) to Next.js. \
> > How to customize what goes inside the <head></head> for each page. \
> > How to create a reusable React component which is styled using CSS Modules. \
> > How to add global CSS in pages/\_app.js. \
> > Some useful tips for styling in Next.js.

## [Assets](https://nextjs.org/learn/basics/assets-metadata-css/assets)

> Next.js can serve static assets, like images, under the top-level public directory. Files inside public can be referenced from the root of the application similar to pages. \
> The public directory is also useful for robots.txt, Google Site Verification, and any other static assets. Check out the documentation for Static File Serving to learn more.

### images

> folder structure :: /public/images

### Image Component

> Images are lazy loaded by default.

```
import Image from 'next/image'
```
