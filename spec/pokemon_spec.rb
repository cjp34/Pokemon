require_relative 'spec_helper'


describe "search_species" do
    it "calls back Sepcies" do
        expect(Pokemon.all[0].species).to eq("Bulbasaur")
        expect(Pokemon.all[150].species).to eq("Mew")
    end

    it "calls back Type(s)" do 
        expect(Pokemon.all[89].poke_type).to eq("Water")
        expect(Pokemon.all[90].poke_type).to eq("Water, Ice")
    end

    it "calls back ID" do 
        expect(Pokemon.all[90].id).to eq(91)
    end

    it "calls back Trainer name" do
        Trainer.create(name: "yeet")
        expect(Trainer.last.name).to eq("yeet")
    end

    it "calls back location" do 
        expect(Pokemon.all[0].location).to eq("Field")
    end
end