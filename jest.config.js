const config = {
  verbose: true,
  moduleNameMapper: {
    "\\.(css|less)$": "<rootDir>/test/javascript/__mocks__/styleMock.js",
  },
  testEnvironment: "jsdom",
  modulePaths: ["app/javascript/components"],
  testMatch: ["**/test/**/*.test.[jt]s?(x)"],
};

module.exports = config;
