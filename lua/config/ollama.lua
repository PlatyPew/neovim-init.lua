require("ollama").setup({
    model = "llama3:8b",
    prompts = {
        Comment = {
            system = "You are an expert in the $ftype language",
            prompt = "Document the following code block with comments.\n\n```$ftype\n$sel```",
            action = "display_replace",
            extract = "```$ftype\n(.-)```",
        },
    },
})
