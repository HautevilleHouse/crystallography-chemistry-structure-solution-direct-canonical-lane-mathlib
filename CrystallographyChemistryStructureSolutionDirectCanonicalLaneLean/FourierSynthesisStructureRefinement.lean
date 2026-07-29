import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

structure FourierSynthesisStructureRefinementPackage where
  electronDensityMap : ℝ³ → ℝ
  differenceFourierMaps : ℕ → (ℝ³ → ℝ)
  refinementCycles : ℕ
  rFactor : ℝ
  weightedRFactor : ℝ
  goodnessOfFit : ℝ
  structureSolved : Prop

structure FourierSynthesisStructureRefinementEvidence (F : FourierSynthesisStructureRefinementPackage) where
  electronDensityComputable : ∀ r : ℝ³, F.electronDensityMap r ≠ 0
  differenceFourierMapsDefined : ∀ n : ℕ, ∃ r : ℝ³, F.differenceFourierMaps n r ≠ 0
  refinementCyclesPositive : F.refinementCycles > 0
  rFactorBelowThreshold : F.rFactor < 0.2
  weightedRFactorBelowThreshold : F.weightedRFactor < 0.3
  goodnessOfFitPositive : F.goodnessOfFit > 0
  structureSolvedClosed : F.structureSolved

def FourierSynthesisStructureRefinementClosed (F : FourierSynthesisStructureRefinementPackage) : Prop :=
  (∀ r : ℝ³, F.electronDensityMap r ≠ 0) ∧
  (∀ n : ℕ, ∃ r : ℝ³, F.differenceFourierMaps n r ≠ 0) ∧
  F.refinementCycles > 0 ∧
  F.rFactor < 0.2 ∧
  F.weightedRFactor < 0.3 ∧
  F.goodnessOfFit > 0 ∧
  F.structureSolved

theorem fourier_synthesis_structure_refinement_closed_from_evidence
    (F : FourierSynthesisStructureRefinementPackage) (E : FourierSynthesisStructureRefinementEvidence F) :
    FourierSynthesisStructureRefinementClosed F := by
  exact And.intro E.electronDensityComputable
    (And.intro E.differenceFourierMapsDefined
      (And.intro E.refinementCyclesPositive
        (And.intro E.rFactorBelowThreshold
          (And.intro E.weightedRFactorBelowThreshold
            (And.intro E.goodnessOfFitPositive E.structureSolvedClosed)))))

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse
