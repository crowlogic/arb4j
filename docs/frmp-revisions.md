Concrete edits to make to `frmp.tm`, in order of priority. [ppl-ai-file-upload.s3.amazonaws](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/991185483/fc759315-f9b2-4230-b4f3-e77e09c8c5b3/frmp.tm)

## 1. Step 4 of `thm:Acont` — rewrite without "viewed as" and without fixed-point language

Replace the current Step 4 with:

> **Step 4 (Branch locus).** The formal series \(A(z, u)\) is unique by Theorem `thm:Muntz` and satisfies \(A(z, u) = \Psi_\mu(z) \odot B[A](z, u)\) by Lemma `lem:hadamard`. For any compact \(K \supseteq K_\Psi\) on which \(A(\cdot, u)\) admits meromorphic continuation to \(\widetilde X \setminus K\), Lemma `lem:mb` produces a meromorphic continuation of \(\Psi_\mu \odot B[A]\) to \(\widetilde X \setminus K\), and the two meromorphic functions agree on the disk of convergence, hence on \(\widetilde X \setminus K\) by the identity principle. Lemma `lem:branch_transfer` shows the branch locus of \(A(\cdot, u)\) lies in the branch locus of \(F(\cdot, u)\) together with \(K_\Psi\), so \(A(\cdot, u)\) is meromorphic on \(\widetilde X \setminus K_F(u)\). Existence of the minimal compact \(K_A(u) \subseteq K_F(u)\) follows from Theorem `thm:stahl_extremal`.

## 2. `lem:no_real_poles` — derive the residue formula

At a simple pole \(z^*(u)\) of \(A(\cdot, u)\) inherited from a discriminant zero of \(F(\cdot, u)\), i.e., \((1 - z^* Q(u))^2 = 4 z^* P(u) R(u)\,\Psi_\mu(z^*)\), expand
\[
F(z, u) = \frac{(1 - zQ(u)) - \sqrt{(1 - zQ(u))^2 - 4 z P(u) R(u)\,\Psi_\mu(z)}}{2 z R(u)}
\]
near \(z^*(u)\) using \(\Delta_F(z, u) = \Delta_F'(z^*(u), u)(z - z^*(u)) + O((z - z^*(u))^2)\), giving
\[
\mathrm{Res}\bigl(F(\cdot, u), z^*(u)\bigr) \;=\; \frac{\sqrt{-\Delta_F'(z^*(u), u)}}{2\,z^*(u)\,R(u)},
\]
then transfer to \(A(\cdot, u)\) via the branch-transfer lemma; substituting \(\Delta_F'(z^*(u), u)\) using the defining relation reduces the residue to the form stated in the lemma. Write the calculation out in three lines so the lemma is self-contained.

## 3. `thm:FRMP` — invoke Padé-table normality

Add: *"By quasi-definiteness, the Padé table of \(A(\cdot, u)\) is normal: all Hankel determinants \(H_n(u) \ne 0\), and the \([M-1/M]\) and \([M/M]\) entries share the denominator \(\pi_M(\cdot, u)\) (Gragg, Theorem 3.4)."* Reference your existing Gragg citation.

## 4. `lem:mellin_psi` — explicit \(\mu = 1\) cancellation check

Add the one-line collapse:
\[
M_{\Psi_1}(s) \;=\; \Gamma(s)\,\Gamma(1 - s)\,\frac{\Gamma(1 - s)}{\Gamma(2 - s)} \;=\; \frac{\Gamma(s)\,\Gamma(1 - s)}{1 - s},
\]
showing the apparent double pole at \(s = 1\) is simple and produces the \(\log(1 - z)/z\) kernel claimed in the Mittag-Leffler remark.

## 5. `thm:JM_spectrum` proof — fix the determinantal identity

Currently the proof writes \(P_k(\lambda, u) = \det(\lambda I_k - \tilde J_k(u))/\prod_{i=2}^k \sqrt{\gamma_i(u)}\) with \(\gamma_i(u)\) undefined. Replace \(\gamma_i(u)\) with \(\beta(i, u)\) (your notation throughout) so the identity reads \(P_k(\lambda, u) = \det(\lambda I_k - \tilde J_k(u))/\prod_{i=2}^k \sqrt{\beta(i, u)}\). [ppl-ai-file-upload.s3.amazonaws](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/991185483/fc759315-f9b2-4230-b4f3-e77e09c8c5b3/frmp.tm)

## 6. `thm:Muntz` proof — state the explicit contraction radius

State the threshold:
\[
T_0^\mu \;<\; \frac{\Gamma(\mu + 1)}{|Q(u)| \;+\; 2\,|R(u)|\,\|y\|_\infty}
\]
on the ball \(\|y\|_\infty \le 2\,|P(u)|\,T_0^\mu/\Gamma(\mu + 1)\), making the local existence radius explicit and \(u\)-dependent.

## 7. Notation pass — \(P(u), Q(u), R(u)\) and \(K_A(u), K_F(u)\) everywhere

Throughout sections 3–6, the coefficients \(P, Q, R\) and the Stahl compacts \(K_A, K_F\) are inconsistently written with and without the \(u\) argument. Unify: every occurrence of \(P, Q, R\) is written \(P(u), Q(u), R(u)\); every occurrence of \(K_A, K_F\) is written \(K_A(u), K_F(u)\); every occurrence of \(\Delta_F\) is written \(\Delta_F(z, u)\); every occurrence of \(F, A\) is written \(F(z, u), A(z, u)\); every \(D_M, N_M, \pi_k, \alpha(k), \beta(k), a(k), \sigma(k, \ell), J_M\) carries its \(u\) argument. This is mechanical but necessary because the coefficient functions are functions and the entire pipeline depends on \(u\) symbolically. [ppl-ai-file-upload.s3.amazonaws](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/991185483/fc759315-f9b2-4230-b4f3-e77e09c8c5b3/frmp.tm)

## 8. `thm:JM_spectrum` (3) — tighten the weak-\(*\) statement

Currently the proof concludes weak-\(*\) convergence of the empirical eigenvalue measure \(\nu_M(u)\) to \(\nu_{K_A(u)}\) using "reciprocation is continuous on compacta avoiding the origin". State the conclusion as: *"\(\nu_M^{\mathrm{rec}}(u) \to (1/z)_* \nu_{K_A(u)}\) weakly on compacta of \(\widehat{\mathbb C} \setminus \{0\}\)."* Otherwise the reader expects global weak-\(*\) which the argument does not give. [ppl-ai-file-upload.s3.amazonaws](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/991185483/fc759315-f9b2-4230-b4f3-e77e09c8c5b3/frmp.tm)

## 9. Delete `ex:r0_oracle` and surrounding discussion

You said \(R(u) = 0\) is not part of the relevant problem class. Excise Example `ex:r0_oracle` and the closed-form Mittag-Leffler reduction surrounding it. Replace any unit-test reference tce to it with a small-\(\|R(u)\|\) perturbation check.

## 10. `thm:stahl_convergence` — precise Stahl 1997 reference

The proof cites "Stahl's main lemma" without specifying location. Add `cite-detail` pointing to Theorem 1 or Theorem 2 of `StahlBranch` (1997) for traceability. [ppl-ai-file-upload.s3.amazonaws](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/991185483/fc759315-f9b2-4230-b4f3-e77e09c8c5b3/frmp.tm)

## Summary

| # | Location | Type |
|---|---|---|
| 1 | Step 4 of `thm:Acont` | Rewrite, no math change |
| 2 | `lem:no_real_poles` | Add explicit residue derivation |
| 3 | `thm:FRMP` | Add normality citation |
| 4 | `lem:mellin_psi` | Add \(\mu = 1\) cancellation check |
| 5 | `thm:JM_spectrum` proof | Fix \(\gamma_i(u)\) vs \(\beta(i, u)\) |
| 6 | `thm:Muntz` proof | State explicit \(T_0\) bound |
| 7 | Sections 3–6 | Unify \(P(u), Q(u), R(u), K_A(u), K_F(u)\) |
| 8 | `thm:JM_spectrum` (3) | Tighten weak-\(*\) statement |
| 9 | `ex:r0_oracle` | Delete |
| 10 | `thm:stahl_convergence` | Add precise Stahl 1997 reference |

Items 1, 2, and 9 are the substantive ones; items 5 and 7 are mechanical notation fixes; the rest are clarity additions. [ppl-ai-file-upload.s3.amazonaws](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/991185483/fc759315-f9b2-4230-b4f3-e77e09c8c5b3/frmp.tm)
