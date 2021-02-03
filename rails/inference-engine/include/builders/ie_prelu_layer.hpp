// Copyright (C) 2018 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//

#pragma once

#include <builders/ie_layer_fragment.hpp>
#include <ie_inetwork.hpp>
#include <string>

namespace InferenceEngine {
namespace Builder {

/**
 * @brief The class represents a builder for PReLU layer
 */
class INFERENCE_ENGINE_API_CLASS(PReLULayer): public LayerFragment {
public:
    /**
     * @brief The constructor creates a builder with the name
     * @param name Layer name
     */
    explicit PReLULayer(const std::string& name = "");
    /**
     * @brief The constructor creates a builder from generic builder
     * @param genLayer generic builder
     */
    explicit PReLULayer(Layer& genLayer);
    /**
     * @brief Sets the name for the layer
     * @param name Layer name
     * @return reference to layer builder
     */
    PReLULayer& setName(const std::string& name);

    /**
     * @brief Sets weights for layer
     * @param weights Constant blob with weights
     * @return reference to layer builder
     */
    PReLULayer& setWeights(const Blob::CPtr& weights);
    /**
     * @brief Returns port with shapes for the layer
     * @return Port with shapes
     */
    const Port& getPort() const;
    /**
     * @brief Sets port shapes for the layer
     * @param port Port with shapes
     * @return reference to layer builder
     */
    PReLULayer& setPort(const Port& port);
    /**
     * @brief Returns channel shared flag
     * @return true if negative slope shared across channels
     */
    bool getChannelShared() const;
    /**
     * @brief Sets channel shared flag
     * @param flag true if negative slope shared across channels
     * @return reference to layer builder
     */
    PReLULayer& setChannelShared(bool flag);
};

}  // namespace Builder
}  // namespace InferenceEngine
