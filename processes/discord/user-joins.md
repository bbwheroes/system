# User joins the server

```mermaid
sequenceDiagram
    User->>Discord: Joins the server
    Discord-)Bot: Send user join event
    Bot--)Discord: Assign default role to user
```