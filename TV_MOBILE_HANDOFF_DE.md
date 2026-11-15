# Streamia Player – Smartphone-Referenz + Android-TV-Erweiterung

## Ausgangspunkt
Diese Projektversion basiert auf der vom Nutzer hochgeladenen älteren `StreamiaPlayer-Recovery50-main(5).zip`, nicht auf dem späteren 29-Dateien-UI-Umbau. Smartphone-Oberflächen für Live-TV, VOD, Serien und Player wurden **nicht** ersetzt.

## Änderungen
- Native Android-TV-Erkennung via `UiModeManager` und Android-Features in `MainActivity.kt`.
- `DeviceLayout` trennt TV-Start im Querformat von Smartphone-Onboarding im Hochformat; ab Dashboard Querformat.
- Dashboard: ausschließlich auf Android TV 4 Spalten bei >= 1100 logischen Pixeln, großzügiger Rand und deutlich sichtbarer D-Pad-Fokusrahmen.
- Playlist-Setup, wenn aus dem Dashboard geöffnet: Smartphone Hochformat, danach wieder Querformat; TV unverändert.
- Bereits vorhandene Flutter-Fokusnavigation und Player-D-Pad-Tasten bleiben erhalten.

## Wichtig
- **Kein Flutter-SDK in dieser Umgebung:** weder `flutter analyze` noch `flutter build apk` ausgeführt.
- ZIP-Integrität und statische Struktur wurden geprüft, nicht das Verhalten auf realer Hardware.
- Die zugehörige Referenz-APK und Projekt-ZIP konnten nicht als exakt gleicher Build bestätigt werden.
- Bitte als neues GitHub-Repository hochladen und GitHub Actions APK-Build ausführen. Erst danach auf Smartphone und Android TV testen.
- Die APK-Datei selbst ist NICHT Teil dieses Quellcode-ZIPs.

## Testfolge
1. Handy: Splash, Sprache, Login, Disclaimer, Playlist-Eingabe im Hochformat.
2. Handy: Dashboard, Live-TV, VOD, Serien und Player im Querformat; alte Layouts unverändert.
3. Handy: Playlist-Einrichtung aus Dashboard öffnen und zurückgehen.
4. TV: Launcher, Querformat, Dashboard D-Pad-Fokus und OK/Zurück.
5. TV: Live-TV, Player, Kategorien, Episoden, Favoriten, Aufnahmen und Downloads mit Fernbedienung testen.
6. Prüfen: Supabase-Anmeldung, Trial/Pro, Playlist-Restore und Aufnahmen.
