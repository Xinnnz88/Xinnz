// api/load.js
// ─────────────────────────────────────────────
// Ganti kedua nilai di bawah ini saja
const GITHUB_RAW_URL = "https://raw.githubusercontent.com/USERNAME/REPO/main/Sour_lua_fixed.lua"
const DISCORD_INVITE  = "https://discord.gg/XXXXXXX"
// ─────────────────────────────────────────────

export default async function handler(req, res) {
    const ua = req.headers["user-agent"] || ""

    // Kalau yang buka adalah browser → redirect ke Discord
    const isBrowser = /Mozilla|Chrome|Safari|Firefox|Edge/i.test(ua)
    if (isBrowser) {
        res.setHeader("Location", DISCORD_INVITE)
        return res.status(302).end()
    }

    // Kalau executor/script → fetch & kirim script
    try {
        const response = await fetch(GITHUB_RAW_URL)
        if (!response.ok) {
            return res.status(500).send("-- fetch error: " + response.status)
        }
        const script = await response.text()
        res.setHeader("Content-Type", "text/plain")
        res.setHeader("Cache-Control", "no-store")
        return res.status(200).send(script)
    } catch (e) {
        return res.status(500).send("-- server error: " + e.message)
    }
}
