local options = {
  context = "buffers",
  model = "claude-sonnet-4.6",
  window = {
    layout = "vertical",
    relative = "cursor",
  },
  mappings = {
    show_diff = {
      normal = "sd",
    },
  },
  providers = {
    google_ai_studio = {
      get_url = function()
        return "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions"
      end,
      get_headers = function()
        return {
          ["Authorization"] = "Bearer AQ.Ab8RN6IhT0PEQ-JMu6xYH6t6cBxO1mUMvit0UKXxLdTTj5hAWw",
        }
      end,
      get_models = function()
        return { { id = "gemini-3.1-flash-lite", name = "gemini-3.1-flash-lite" } }
      end,
      prepare_input = function(data, dev)
        return require("CopilotChat.config.providers").copilot.prepare_input(data, dev)
      end,
      prepare_output = function(data, dev)
        return require("CopilotChat.config.providers").copilot.prepare_output(data, dev)
      end,
    },
  }
}

return options
