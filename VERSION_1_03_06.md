## Letzter Fix
- Log System überarbeitet: Neuer Serverlog für Punktestand und Endstand, Ziehen von Flaggen
- Intro Synchronization entfernt, spielt nun wieder zu Beginn
- Fahrzeugabschusslog nicht mehr MPKilled, wodurch Mehrfachlog ausgelöst wurde für jeden Client
- Spielerabschusslog jetzt in FAR revive enthalten, dadurch wieder korrekter Log
- Log aus killed EH entfernt
- Handle Damage EH in FAR Revive komplett überarbeitet -> Bug in Vanilla, der bei Beinschuss Schaden abnorm hoch setzt. Aktuell wird Gesamtschaden (hitSelection "") ignoriert, so dass nur der Schaden der einzelnen Teile zählt. TODO: TESTEN
- Bugfix: Manchmal Unmächtigkeit ohne Bleedout Timer. Denke ich habe es behoben