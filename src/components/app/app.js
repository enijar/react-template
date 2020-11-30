import React from "react";
import { Route, Switch } from "react-router-dom/cjs/react-router-dom";
import "./app.scss";

const Home = React.lazy(() => import("../../pages/home/home"));

export default function App() {
  return (
    <React.Suspense fallback="Loading...">
      <Switch>
        <Route exact path="/" component={Home} />
      </Switch>
    </React.Suspense>
  );
}
