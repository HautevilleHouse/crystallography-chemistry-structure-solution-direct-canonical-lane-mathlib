import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

structure PhaseProblemFormulationPackage where
  observedIntensities : ℕ → ℝ
  computedStructureFactors : ℕ → ℂ
  phaseValues : ℕ → ℝ
  electronDensityMap : ℝ³ → ℝ
  directMethodsSolution : Prop
  structureRefined : Prop

structure PhaseProblemFormulationEvidence (P : PhaseProblemFormulationPackage) where
  intensityNonnegative : ∀ h : ℕ, P.observedIntensities h ≥ 0
  structureFactorConsistency : ∀ h : ℕ, ‖P.computedStructureFactors h‖ ^ 2 = P.observedIntensities h
  phaseValuesDefined : ∀ h : ℕ, P.phaseValues h ≠ 0 ∨ P.observedIntensities h = 0
  directMethodsSolutionClosed : P.directMethodsSolution
  structureRefinedClosed : P.structureRefined

def PhaseProblemFormulationClosed (P : PhaseProblemFormulationPackage) : Prop :=
  (∀ h : ℕ, P.observedIntensities h ≥ 0) ∧
  (∀ h : ℕ, ‖P.computedStructureFactors h‖ ^ 2 = P.observedIntensities h) ∧
  (∀ h : ℕ, P.phaseValues h ≠ 0 ∨ P.observedIntensities h = 0) ∧
  P.directMethodsSolution ∧
  P.structureRefined

theorem phase_problem_formulation_closed_from_evidence
    (P : PhaseProblemFormulationPackage) (E : PhaseProblemFormulationEvidence P) :
    PhaseProblemFormulationClosed P := by
  exact And.intro E.intensityNonnegative
    (And.intro E.structureFactorConsistency
      (And.intro E.phaseValuesDefined
        (And.intro E.directMethodsSolutionClosed E.structureRefinedClosed)))

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse
