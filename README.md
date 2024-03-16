# Valūtas kursu lietotne

Šī C# lietotne veic šādas darbības:

1. **Valūtas kursu iegūšana:**
   Tā iegūst valūtas kursus no konkrēta datuma mājas lapā [šeit](https://www.bank.lv/vk/ecb.xml?date=20050323).

2. **Valūtas kursu saglabāšana MS SQL datu bāzē:**
   Tā saglabā iegūtos valūtas kursus MS SQL datu bāzē, izmantojot SQL saglabātās procedūras.

3. **Tīmekļa lapas izveide, izmantojot ASP.NET MVC:**
   Lietotne izmanto ASP.NET MVC, lai izveidotu tīmekļa lapu, kas veic pieprasījumus uz MS SQL serveri, izmantojot saglabātās procedūras. Iegūtā informācija tiek parādīta tīmekļa lapā formatētā un lasāmā veidā.
