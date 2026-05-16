// api/load.js
// ─────────────────────────────────────────────────────────────
// Isi nilai di bawah ini
const DISCORD_INVITE = "https://discord.gg/XXXXXXX"

// Repo private: USERNAME/REPO/BRANCH/path/ke/file.lua
const GITHUB_USER   = "USERNAME"
const GITHUB_REPO   = "REPO"
const GITHUB_BRANCH = "main"
const GITHUB_PATH   = "Sour_lua_fixed.lua"

// Token disimpan di Vercel Environment Variables (jangan hardcode di sini)
// Vercel → Settings → Environment Variables → GITHUB_TOKEN
// ─────────────────────────────────────────────────────────────

export default async function handler(req, res) {
    const ua = req.headers["user-agent"] || ""

    // Browser → redirect ke Discord
    const isBrowser = /Mozilla|Chrome|Safari|Firefox|Edge/i.test(ua)
    if (isBrowser) {
        res.setHeader("Location", DISCORD_INVITE)
        return res.status(302).end()
    }

    // Executor → fetch script dari GitHub (support private repo)
    try {
        const token = process.env.GITHUB_TOKEN

        // Pakai GitHub Contents API (support private repo)
        const apiUrl = `https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/contents/${GITHUB_PATH}?ref=${GITHUB_BRANCH}`

        const response = await fetch(apiUrl, {
            headers: {
                "Accept": "application/vnd.github.v3.raw",
                "User-Agent": "XinnzHub-Vercel",
                ...(token ? { "Authorization": `token ${token}` } : {})
            }
        })

        if (!response.ok) {
            const msg = `-- [Xinnz] GitHub error: ${response.status} ${response.statusText}`
            return res.status(502).send(msg)
        }

        const script = await response.text()

        res.setHeader("Content-Type", "text/plain; charset=utf-8")
        res.setHeader("Cache-Control", "no-store, no-cache")
        res.setHeader("X-Powered-By", "XinnzHub")
        return res.status(200).send(script)

    } catch (e) {
        return res.status(500).send("-- [Xinnz] Server error: " + e.message)
    }
}
