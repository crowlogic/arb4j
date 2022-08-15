package arb;

public enum Protections
{
 PROT_READ(0x1), /* Page can be read. */
 PROT_WRITE(0x2), /* Page can be written. */
 PROT_EXEC(0x4), /* Page can be executed. */
 PROT_NONE(0x0), /* Page can not be accessed. */
 PROT_GROWSDOWN(0x01000000), /*
                              * Extend change to start of growsdown vma (mprotect only).
                              */
 PROT_GROWSUP(0x02000000);

  public final int bitfield;

  /*
   * Extend change to start of growsup vma (mprotect only).
   */

  Protections(int i)
  {
    this.bitfield = i;
  }
}