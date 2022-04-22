import React from "react";
import { Button } from "antd";
import { ReloadOutlined } from "@ant-design/icons";
import "antd/dist/antd.css";

const MyButton = ({ text, href }) => (
  <Button type="primary" icon={<ReloadOutlined />} size="large" href={href}>
    {text}
  </Button>
);

export default MyButton;
