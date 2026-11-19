---
layout: default
title: "Play City of Kalux"
description: Play City of Kalux, a detective game with AI navigation, in your browser.
permalink: /play/city-of-kalux/
---

<div class="kalux-play-page">
  <nav class="kalux-breadcrumbs" aria-label="Breadcrumb">
    <a href="{{ '/portfolio/#city-of-kalux' | relative_url }}">Portfolio</a>
    <span aria-current="page">City of Kalux</span>
  </nav>

  <header class="kalux-play-header">
    <h1>City of Kalux</h1>
    <p>Explore the detective game in your browser. Use a desktop computer with a keyboard to play. This browser version is silent.</p>
  </header>

  <p class="kalux-desktop-notice">
    The game requires keyboard input and is available on desktop devices. Please visit this page on a desktop computer to play.
  </p>

  <section class="kalux-game-frame" aria-label="City of Kalux game">
    <p id="kalux-game-status" class="kalux-game-status" role="status" aria-live="polite">
      JavaScript is required to start the game.
    </p>
    <div id="kalux-game-display"></div>
  </section>

  <noscript>
    <p>Enable JavaScript on a desktop computer to play City of Kalux.</p>
  </noscript>
</div>

<script type="module">
  const desktopInput = window.matchMedia("(min-width: 768px) and (hover: hover) and (pointer: fine)");
  const status = document.getElementById("kalux-game-status");
  const display = document.getElementById("kalux-game-display");

  if (desktopInput.matches) {
    status.textContent = "Loading the Java runtime...";

    const cheerpjLoader = document.createElement("script");
    cheerpjLoader.src = "https://cjrtnc.leaningtech.com/5.0/loader.js";
    cheerpjLoader.onload = async () => {
      try {
        await cheerpjInit({ version: 17, status: "splash" });
        cheerpjCreateDisplay(-1, 830, display);
        status.textContent = "The game is loading. Click its window to use the keyboard controls.";
        const exitCode = await cheerpjRunMain(
          "game.KaluxGame",
          "/app/assets/portfolio/city-of-kalux/City-of-Kalux-browser-compat.jar:/app/assets/portfolio/city-of-kalux/City-of-Kalux.jar"
        );
        if (exitCode !== 0) {
          throw new Error(`The game exited with code ${exitCode}.`);
        }
        status.textContent = "City of Kalux has closed.";
      } catch (error) {
        console.error("Could not start City of Kalux.", error);
        status.textContent = "The game could not be started. Please refresh the page and try again.";
      }
    };
    cheerpjLoader.onerror = () => {
      status.textContent = "The Java runtime could not be loaded. Check your connection and refresh the page.";
    };
    document.head.appendChild(cheerpjLoader);
  }
</script>
