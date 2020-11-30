import React from "react";
import "./page.scss";

export default function Page({ name, children }) {
  return <div className={`page page--${name}`}>{children}</div>;
}
