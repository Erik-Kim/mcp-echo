# MCP Server Boilerplate

A basic Model Context Protocol (MCP) server implementation that can be used as a starting point for building MCP-compatible applications.

## Features

- Basic MCP server setup with TypeScript
- Example function implementation
- Graceful shutdown handling
- Development and production build configurations

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn

## Installation

```bash
npm install
```

## Development

To run the server in development mode with hot-reload:

```bash
npm run dev
```

## Building for Production

To build the project:

```bash
npm run build
```

To start the production server:

```bash
npm start
```

## Project Structure

```
├── src/
│   └── index.ts    # Main server implementation
├── package.json    # Project dependencies and scripts
├── tsconfig.json  # TypeScript configuration
└── README.md      # This file
```

## Adding New MCP Functions

To add new functions to the server:

1. Define a new function schema using Zod
2. Create a function implementation following the MCPFunction interface
3. Add the function to the server configuration

Example:

```typescript
const myNewFunction: MCPFunction = {
  name: 'my_new_function',
  description: 'Description of what the function does',
  parameters: z.object({
    // Define your parameters here
  }),
  handler: async (params) => {
    // Implement your function logic here
    return {
      // Return your response here
    };
  }
};
```

## License

ISC 