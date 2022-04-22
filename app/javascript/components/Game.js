import React from "react";
import PixelGrid from "react-pixel-grid";
import MyButton from "./MyButton";

const Game = ({ data }) => (
  <>
    <h1>Game of Life</h1>
    <PixelGrid
      data={data}
      options={{
        size: 10,
        padding: 2,
        background: [0, 0.5, 1],
      }}
    />
    <MyButton text={"Next"} href={"javascript:window.location.reload(true)"} />
  </>
);

export default Game;
