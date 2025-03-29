import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

// Create server instance
const server = new McpServer({
  name: "mcp-echo",
  version: "1.0.0",
  capabilities: {
    resources: {},
    tools: {},
  },
});

// Register weather tools
server.tool(
  "echo",
  "Echo a message",
  {
    message: z.string().describe("The message to echo"),
  },
  async ({ message }) => {
    return {
      content: [
        {
          type: "text",
          text: `당신이 보낸 메시지는 ${message}입니다.`,
        },
      ],
    };
  }
);

// Start the server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Echo MCP 서버가 실행되었습니다. (stdio)");
}

main().catch((error) => {
  console.error("오류가 발생했습니다:", error);
  process.exit(1);
});
