# 🧩 Modrinth Server

> 🐋 Easily deploy any **Modrinth modpack** as a dedicated Minecraft server — powered by Docker and [`nothub/mrpack-install`](https://github.com/nothub/mrpack-install)!  

No manual setup, no messy file juggling — just give it a `.mrpack` URL and let the magic happen ✨

---

## 🏗️ What This Does

This project wraps [`mrpack-install`](https://github.com/nothub/mrpack-install) inside a lightweight Docker image to automatically:

1. 🧱 **Download & unpack** a Modrinth `.mrpack` file  
2. ⚙️ **Install** the required mod loader (currently supports **NeoForge**, more coming soon!)  
3. 🚀 **Launch** the Minecraft server — all automatically  

---

## 🐳 Quick Start

You can use **Docker Compose** to spin up a server instantly.  
Copy the example config:

```bash
cp docker-compose.example.yml docker-compose.yml
```

Then edit `docker-compose.yml` to set your modpack URL:

```yaml
services:
  my-server:
    build: .
    container_name: my-modrinth-server
    ports:
      - "25565:25565"
    volumes:
      - ./data:/app/mcserver
    environment:
      MRPACK_URL: "https://cdn.modrinth.com/data/xxxxx/versions/yyyyy/MyPack.mrpack"
      JAVA_ARGS: "-Xmx6G -Xms4G"
    restart: unless-stopped
```

Now just run:

```bash
docker compose up -d
```

That’s it! 🎉  
Your Minecraft server will automatically install and start with the given modpack.

---

## ⚙️ Environment Variables

| Variable | Required | Description | Default |
|-----------|-----------|-------------|----------|
| `MRPACK_URL` | ✅ Yes | Direct URL to a `.mrpack` file from Modrinth | *(none)* |
| `JAVA_ARGS` | ❌ No | JVM arguments (e.g., memory size) | `-Xmx6G -Xms4G` |
| `SERVER_DIR` | ❌ No | Where to install the server files | `/app/mcserver` |

---

## 🧠 How It Works

Under the hood:
- Uses [`nothub/mrpack-install`](https://github.com/nothub/mrpack-install) to build the modpack’s server files  
- Automatically runs the `run.sh` provided by the mod loader (NeoForge, etc.)
- Accepts the Minecraft EULA automatically (`eula=true`)

---

## 📦 Example Compose File

Check out [`docker-compose.example.yml`](./docker-compose.example.yml) for a ready-to-edit config template 🧾

---

## 🧰 Tech Used

- 🐋 **Docker** — for easy and repeatable deployment  
- ☕ **Eclipse Temurin JDK 22 (Alpine)** — lightweight Java runtime  
- 🧱 **mrpack-install** — the Modrinth modpack installer by [@nothub](https://github.com/nothub)

---

## 🪪 License

This project is licensed under the **MIT License** — meaning:  
> Do whatever you want with it, just keep the copyright notice and don’t blame us if it breaks. 💥

See [LICENSE](./LICENSE) for details.

---

## ❤️ Credits

- 🧑‍💻 [nothub/mrpack-install](https://github.com/nothub/mrpack-install) for the awesome modpack installer  
- 🧱 Inspired by the Minecraft modding community  

---

🧠 *Tip:* The repository ignores any `ruifrite`-specific files — those are just local test setups and not part of the main project.
