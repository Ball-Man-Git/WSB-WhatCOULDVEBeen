saveiconTimer -= 1;
saveiconIndex += 0.35;
saveiconAlpha = approach(saveiconAlpha, (saveiconTimer > 0) ? 1 : 0, 0.1);

clothesUnlockTimer -= 1;
clothesUnlockAlpha = approach(clothesUnlockAlpha, (clothesUnlockTimer > 0) ? 1 : 0, 0.1);
