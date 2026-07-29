import CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

def ConstrainedCrystallographyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_crystallography_endgame (A : AdmissibleClass) :
    ConstrainedCrystallographyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse